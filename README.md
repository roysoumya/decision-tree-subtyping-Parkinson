# decision-tree-subtyping-Parkinson
Codebase for the journal paper "Decision Tree-based Approach to Robust Parkinson's Disease Subtyping using Clinical Data of the Michael J. Fox Foundation LRRK2 Cross-sectional Study" published at the **Frontiers in Artificial Intelligence** Journal under Section **Medicine and Public Health** (Impact Factor: 4.7)

Open Access Paper Link: [https://doi.org/10.3389/frai.2025.1668206](https://doi.org/10.3389/frai.2025.1668206)

## Datasets

### LRRK2 Dataset
We have used the LRRK2 Cross-sectional Study Dataset from the Michael J Fox Foundation. Details regarding how to get access, dataset description and other dataset details are available at [https://www.michaeljfox.org/news/lrrk2-cohort-consortium](https://www.michaeljfox.org/news/lrrk2-cohort-consortium)


### MDS Dataset
This is used as the external validation dataset for validating the LRRK2 subtypes. It is available at this [GitHub repository](https://github.com/ferjorosa/parkinson-subtypes) ; please follow the README file of this codebase, to answer any queries regarding it.

## Citation
```
@ARTICLE{pdsubtyping2025,
AUTHOR={Roy, Soumyadeep  and Krähe, Stefanie  and Marschollek, Michael  and Frieling, Helge  and Ganguly, Niloy  and Wolff, Dominik },
TITLE={Decision tree-based approach to robust Parkinson's disease subtyping using clinical data of the Michael J. Fox Foundation LRRK2 cross-sectional study},
JOURNAL={Frontiers in Artificial Intelligence},
VOLUME={Volume 8 - 2025},
YEAR={2025},
URL={https://www.frontiersin.org/journals/artificial-intelligence/articles/10.3389/frai.2025.1668206},
DOI={10.3389/frai.2025.1668206},
ISSN={2624-8212},
ABSTRACT={Parkinson's Disease (PD) is a neurodegenerative disorder with high heterogeneity in clinical symptoms, progression course, treatment response, and genetic factors. Thus, PD subtyping aims to enhance understanding of disease mechanisms and helps to facilitate targeted interventions or treatment regimens. Data-driven PD subtyping is typically done using cluster analysis. Still, such studies face difficulty from widespread adoption in clinical practice due to the following issues: (i) results are quite sensitive to study design, and actual subtype rules are not reasonably interpretable; (ii) results are not robustly replicable across multiple datasets, and most studies focus on a single dataset. This paper aims to identify novel PD subtypes using an interpretable decision-tree-based method that is robustly reproducible in an independent PD cohort. We first train a decision tree classifier on an LRRK2 dataset to determine whether a patient has early onset or late onset PD. By tracing back from the leaves of the learned decision tree subtyping rules are established. The independent MDS dataset is used for external validation, after mapping features between the two datasets. We finally obtained six novel subtypes that are clinically consistent and sufficiently large across both training and external validation datasets. Finally, a clinical characterization study showed that the following clinical features may be the most important diagnostic markers for our six detected subtypes: (i) persistent asymmetry affecting the side of onset most, (ii) clinical course of 10 years or more, and (iii) postural instability not caused by other dysfunction. The subtypes identified in our study may provide relevant guidance for prognosis and therapeutic strategies. An early onset subtype (E4) can be linked to a comparatively favorable prognosis. In contrast, the mixed onset subtypes (M3 and M7) may predict faster functional decline, suggesting that patients in these groups could benefit from intensified supportive measures. One late onset subtype (L1) seems to have a more benign course, while the other two (L2 and L4) are connected with predictors of reduced quality of life and increased care dependency.}}
```
