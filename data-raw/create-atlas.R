library(ggsegExtra)
library(ggseg)
library(ggseg3d)
library(dplyr) # for cleaning the atlas data efficiently
library(tidyr) # for cleaning the atlas data efficiently
devtools::load_all(".")
devtools::load_all("../ggsegExtra/")

# The unique name of the atlas annot, without hemisphere in filename
annot_name <- "ica"

# You might need to convert the annotation file
# convert atlas to fsaverage5
lapply(c("lh", "rh"),
       function(x){
         mri_surf2surf_rereg(subject = "fsaverage",
                             annot = annot_name,
                             hemi = x,
                             output_dir = here::here("data-raw/fsaverage5/"))
       })


# Make  3d ----
ica_3d <- make_aparc_2_3datlas(
  annot = annot_name,
  annot_dir = here::here("data-raw/fsaverage5/"),
  output_dir = here::here("data-raw/")
)
ggseg3d(atlas  = ica_3d)

## fix atlas ----
# you might need to do some alteration of the atlas data,
# like cleaning up the region names so they do not contain
# hemisphere information, and any unknown region should be NA
ica_n <- ica_3d
ica_n <- unnest(ica_n, ggseg_3d)
ica_n <- mutate(ica_n,
                    region = gsub("LH_|RH_|region_", "", region),
                    region = ifelse(grepl("Unknown|\\?", region, ignore.case = TRUE), 
                                    NA, region),
                    atlas = "ica_3d"
)
ica_3d <- as_ggseg3d_atlas(ica_n)
ggseg3d(atlas  = ica_3d)


# Make palette ----
brain_pals <- make_palette_ggseg(ica_3d)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")


# Make 2d polygon ----
ica <- make_ggseg3d_2_ggseg(ica_3d, 
                            steps = 6:7,
                            tolerance = .5,
                            output_dir = here::here("data-raw/"))

plot(ica)

ica %>%
  ggseg(atlas = ., show.legend = TRUE,
        colour = "black",
        mapping = aes(fill=region)) +
  scale_fill_brain("ica", package = "ggsegIca", na.value = "black")


usethis::use_data(ica, ica_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")


# make hex ----
atlas <- ica

p <- ggseg(atlas = atlas,
           hemi = "left",
           view = "lateral",
           show.legend = FALSE,
           colour = "grey30",
           size = .2,
           mapping = aes(fill =  region)) +
  scale_fill_brain2(palette = atlas$palette) +
  theme_void() +
  hexSticker::theme_transparent()

lapply(c("png", "svg"), function(x){
  hexSticker::sticker(p,
                      package = "ggsegIca",
                      filename = sprintf("man/figures/logo.%s", x),
                      s_y = 1.2,
                      s_x = 1,
                      s_width = 1.5,
                      s_height = 1.5,
                      p_family = "mono",
                      p_size = 10,
                      p_color = "grey30",
                      p_y = .6,
                      h_fill = "white",
                      h_color = "grey30"
  )
  
})

pkgdown::build_favicons(overwrite = TRUE)
