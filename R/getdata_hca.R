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
#' @param sample column from manifest_tibble to analyze
#' @param mem_gb memory to allocate for running the workflow, default: 60 GB
#' @examples
#' sample = "donor_organism.biomaterial_core.biomaterial_id"
#' update_file_avtable(manifest_tibble, sample, core, mem_gb)
#' @export
update_file_avtable <- function(manifest_tibble, sample, core, mem_gb) {
  manifest_tibble |> 
    mutate(
      file = file_uuid,
      knitr_eval = TRUE,
      sample = sample,
      core = 10,
      mem_gb = 60
    ) |>
    select(
      file,
      knitr_eval,
      sample,
      core,
      mem_gb,
      project_title = project.project_core.project_title,
      genus_species = donor_organism.genus_species,
      diseases = specimen_from_organism.diseases,
      organ = specimen_from_organism.organ,
      organ_part = specimen_from_organism.organ_part,
      donor_organism_id = donor_organism.biomaterial_core.biomaterial_id,
      cell_suspension_id = cell_suspension.biomaterial_core.biomaterial_id,
      sample_id = sample.biomaterial_core.biomaterial_id,
      sequencing_input_id = sequencing_input.biomaterial_core.biomaterial_id
    ) |>
    avtable_import("file")
}
