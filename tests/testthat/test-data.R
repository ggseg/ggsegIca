describe("ica atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(ica(), "ggseg_atlas")
    expect_s3_class(ica(), "cortical_atlas")
  })

  it("is valid", {
    expect_true(ggseg.formats::is_ggseg_atlas(ica()))
  })

  it("renders with ggseg", {
    vdiffr::expect_doppelganger(
      "ica-2d",
      ggseg::brain_test_plot(ica())
    )
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = ica())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})
