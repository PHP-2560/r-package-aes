#' Check Packages
#'
#' This function allows you to check if a package is installed and if it is not, install it. 
#' If it is installed, then the package is loaded.
#' @param names the names of the packages to check
#' @keywords packages
#' @export
#' @examples
#' check_packages()
check_packages = function(names)
{
  for(name in names)
  {
    if (!(name %in% installed.packages()))
      install.packages(name, repos="http://cran.us.r-project.org")
    
    library(name, character.only=TRUE)
  }
}