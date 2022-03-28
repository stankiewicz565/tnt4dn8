#' Gets the gene names from the file names 
#' @param fileLocation the path to the directory to get the filenames from
#' @param splitNumber the number of the character to take when splitting the file name by underscore
#' @param beginning the number of characters to be taken of the beginning of the name
#' @param end the number of characters to be taken of the end of the name. As a negative number.

getGeneNames <- function(fileLocation, splitNumber, beginning , end ){
  files = list.files(path=fileLocation, pattern = "*.filtered")
  sapply(files , function(x){
    y <-strsplit(x,"[_]")[[1]][splitNumber]
    stringr::str_sub(y, beginning, end)
  })
}


cohorts = list(
 alveolar = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Alveolar_Macrophages_IS/CAU.CARE_CAU/",
 CD4_AFR.GRAAD = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/AFR.GRAAD/",
 CD4_AFR.GRAAD_OMIC = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/AFR.GRAAD_Omni2.5/",
 CD4_AFR.STAMPEED = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/AFR.STAMPEED_AFR/",
 CD4_CAU.CARE = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/CAU.CARE_CAU/",
 CD4_CAU.STAMPEED = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/CAU.STAMPEED_CAU/",
 CD4_HIS.CARE = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/CD4_UnStim/HIS.CARE_HIS/",
 PAX_AFR.CAMP_RIKEN = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/AFR.CAMP_RIKEN_AFR/",
 PAX_CAU.CAMP_550KV3 = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/CAU.CAMP_550KV3/",
 PAX_CAU.CAMP_RIKEN = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/CAU.CAMP_610_RIKEN/",
 PAX_CAU.USC = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/CAU.USC_NHW/",
 PAX_HIS.CAMP = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/HIS.CAMP_RIKEN_HIS/",
 PAX_HIS.MCCAS = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/HIS.MCCAS/",
 PAX_HIS.USC = "/proj/regeps/regep00/studies/ABRIG/analyses/reahs/cis_eqtl/eQTL_data/Pax_RNA/HIS.USC_HW/"
 )

alveolarGenes = getGeneNames(fileLocation =cohorts$alveolar, splitNumber = 3, beginning = 4, end = -6)

cd4AfrGraadGenes = getGeneNames(fileLocation =cohorts$CD4_AFR.GRAAD, splitNumber = 2, beginning = 8, end = -6)

cd4AfrGraadOmicGenes = getGeneNames(fileLocation =cohorts$CD4_AFR.GRAAD_OMIC, splitNumber = 2, beginning = 8, end = -6)

cd4CauCareGenes = getGeneNames(fileLocation =cohorts$CD4_CAU.CARE, splitNumber = 2, beginning = 8, end = -6)

cd4CauStampeedGenes = getGeneNames(fileLocation =cohorts$CD4_CAU.STAMPEED, splitNumber = 2, beginning = 8, end = -6)

cd4HisCareGenes = getGeneNames(fileLocation =cohorts$CD4_HIS.CARE, splitNumber = 2, beginning = 8, end = -6)

paxAfrCampGenes = getGeneNames(fileLocation =cohorts$PAX_AFR.CAMP_RIKEN, splitNumber = 2, beginning = 5, end = -6)

paxCauCamp550Genes = getGeneNames(fileLocation =cohorts$PAX_CAU.CAMP_550KV3, splitNumber = 2, beginning = 5, end = -6)

paxCauRikenGenes = getGeneNames(fileLocation =cohorts$PAX_CAU.CAMP_RIKEN, splitNumber = 2, beginning = 5, end = -6)

paxCauUscGenes = getGeneNames(fileLocation =cohorts$PAX_CAU.USC, splitNumber = 2, beginning = 5, end = -6)

paxHisCampGenes = getGeneNames(fileLocation =cohorts$PAX_HIS.CAMP, splitNumber = 2, beginning = 5, end = -6)

paxHisMccasGenes = getGeneNames(fileLocation =cohorts$PAX_HIS.MCCAS, splitNumber = 2, beginning = 5, end = -6)

paxHisUscGenes = getGeneNames(fileLocation =cohorts$PAX_HIS.USC, splitNumber = 2, beginning = 5, end = -6)

















