#' @rdname get_manifest_tibble
#' @title Functions to retrieve hca data and import to terra
#' @importFrom hca dplyr
#' @param filters hca filter object
#' @return `get_manifest_tibble()` returns a tibble
#' @examples
#' filters <- hca::filters(
#'   projectTitle = list(is = "Census of Immune Cells"),
#'   organPart = list(is = "bone marrow"),
#'   fileFormat = list(is = "loom"),
#'   isIntermediate = list(is = FALSE)
#' )
#' 
#' manifest_tibble <- get_manifest_tibble(filters)
#' @export
get_manifest_tibble <- function(filters) {
  file_filter <- files(filters)
  
  manifest_filter <- hca::filters(
    fileId = list(is = file_filter$fileId)
  )
  
  manifest_tibble <- hca::manifest(filters = manifest_filter)
}


#' @rdname update_file_avtable
#' @importFrom hca AnVIL dplyr
#' @param manifest_tibble result of hca manifest
#' @param my_sample column from manifest_tibble to analyze
#' @param mem_gb memory to allocate for running the workflow, default: 60 GB
#' @examples
#' my_sample = "cell_suspension.biomaterial_core.biomaterial_id"
#' update_file_avtable(manifest_tibble, my_sample)
#' @export
update_file_avtable <- function(manifest_tibble, my_sample, mem_gb) {
  manifest_tibble |> 
    mutate(
      file = file_uuid,
      knitr_eval = TRUE,
      sample = my_sample_2,
      mem_gb = 60
    ) |>
    select(
      file,
      knitr_eval,
      sample,
      mem_gb,
      project_title = project.project_core.project_title,
      genus_species = donor_organism.genus_species,
      diseases = specimen_from_organism.diseases,
      organ = specimen_from_organism.organ,
      organ_part = specimen_from_organism.organ_part,
      cell_suspension_id = cell_suspension.biomaterial_core.biomaterial_id,
      donor_organism_id = donor_organism.biomaterial_core.biomaterial_id
    ) |>
    avtable_import("file")
}