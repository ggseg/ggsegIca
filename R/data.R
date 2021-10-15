#' ICA atlas
#'
#' from Abstract:
#' "We present an integrated approach to probabilistic independent component analysis (ICA) 
#' for functional MRI (FMRI) data that allows for nonsquare mixing in the presence of
#' Gaussian noise. In order to avoid overfitting, we employ objective estimation of the
#' amount of Gaussian noise through Bayesian analysis of the true dimensionality of the data,
#' i.e., the number of activation and non-Gaussian noise sources. This enables us to carry 
#' out probabilistic modeling and achieves an asymptotically unique decomposition of the data. 
#' It reduces problems of interpretation, as each final independent component is now much more 
#' likely to be due to only one physical or physiological process.
#'
#' @docType data
#' @name ica
#' @keywords datasets
#' @family ggseg_atlases ggseg3d_atlases
#' @references Beckmann, C. F., & Smith, S. M. (2004). 
#'     Probabilistic independent component analysis for functional magnetic 
#'     resonance imaging. IEEE transactions on medical imaging, 23(2), 137-152.
#'     (\href{https://ieeexplore.ieee.org/document/1263605}{IEEEE})
#'     
#' \itemize{
#'  \item{ica}{ - ica atlas}
#'  \item{ica_3d}{ - ica 3d mesh atlas}
#'}
#'
#' @import ggseg
#' @import ggseg3d
#' @rdname ica
#' @examples
#' data(ica)
#' data(ica_3d)
"ica"

#' @rdname ica
"ica_3d"

