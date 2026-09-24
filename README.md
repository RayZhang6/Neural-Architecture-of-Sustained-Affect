# Neural-Architecture-of-Sustained-Affect
## Overview

This repository contains custom MATLAB code used for the analyses and figure generation reported in the manuscript:

**A distributed neural architecture of sustained affect across external and internal experience**

The scripts support reproduction of the main figures, supplementary figures, predictive-performance analyses across studies, and resting-state fMRI decoder analyses reported in the manuscript.

The code was developed and tested using the following software:
MATLAB R2021a or later
MATLAB Statistics and Machine Learning Toolbox
SPM12
CanlabCore

The code was tested using MATLAB R2021b on Windows and MATLAB R2024a on macOs.

## Contents

Example scripts, including MATLAB Live Scripts (`.mlx`) with saved output, are organized as follows.

### 1. Reproducing manuscript figures

Main figures:

- `A_plot_figure2.mlx`
- `A_plot_figure3a.mlx`
- `A_plot_figure3bc.mlx`
- `A_plot_figure4.mlx`
- `A_plot_figure6ab.mlx`
- `A_plot_figure6cd.mlx`
- `A_plot_figure6ef.mlx`

Supplementary figures:

- `A_plot_supplementary_fig126.m`
- `A_plot_supplementary_fig3.mlx`
- `A_plot_supplementary_fig4.mlx`
- `A_plot_supplementary_fig5.mlx`

### 2. Reproducing predictive performance for each study

- `A_report_study1.mlx`
- `A_report_study2.mlx`
- `A_report_study3.mlx`
- `A_report_study4.mlx`
- `A_report_study5.mlx`
- `A_report_study6.mlx`
- `A_report_study7.mlx`
- `A_report_study8.mlx`
- `A_report_study9.mlx`

### 3. Reproducing Table 2

- `A_rsfmri_decoder_crossvalidation.mlx`
- `A_rsfmri_decoder_corsspredictions.mlx`

## Requirements

The code was developed and tested using the following software:

- MATLAB R2021a or later
- MATLAB Statistics and Machine Learning Toolbox
- SPM12
- CanlabCore

For preprocessing raw MRI data:

- fMRIPrep 22.0.2

No non-standard hardware is required.

## Installation

1. Install MATLAB and the required MATLAB toolboxes.
2. Install SPM12.
3. Download CanlabCore from [https://github.com/canlab](https://github.com/canlab).
4. Add SPM12, CanlabCore, and all required project folders to the MATLAB path.
5. Download and unzip this repository.
6. Set the repository folder as the MATLAB working directory before running the scripts.

## Usage

Open MATLAB, set this repository as the working directory, ensure that all dependencies are on the MATLAB path, and run the relevant script.

Example:
load('Study2_data.mat')
% Please comment out the data-loading lines in the script
% before running the following command.
run('A_report_study2.mlx')

load('Study6_data.mat')
% Please comment out the data-loading lines in the script
% before running the following command.
run('A_report_study6.mlx')

Some scripts contain local file paths from the original analysis environment. These paths should be updated before running the code in a new environment.

## Reproducing manuscript results

To reproduce the manuscript results:

1. Preprocess raw MRI data using fMRIPrep.
2. Perform smoothing, denoising, nuisance regression, and temporal filtering as described in the manuscript and Supplementary Information.
3. Compute parcel-wise functional connectivity.
4. Run the relevant MATLAB scripts for each figure, table, or analysis.

Please note that exact reproduction requires access to the corresponding input data files and the same preprocessing choices described in the manuscript.

## Data availability

Example data for Studies 2 and 6 are included in this repository to demonstrate code usage. The remaining data necessary to evaluate the conclusions of this study, including source data for figures, will be made available in this repository upon publication.

## Contact

For questions about the code or analyses, please contact:

- Ran Zhang: [ray.ranzhang@outlook.com]
- Feng Zhou: [zhou.feng@live.com]
