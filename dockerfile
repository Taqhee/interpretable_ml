# r-base -----------------------------------------------------------------------

# FROM r-base
FROM rocker/rstudio


# Needed libraries -------------------------------------------------------------

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y openssl
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libudunits2-dev
RUN apt-get install -y libv8-3.14-dev
RUN apt-get install -y libgdal-dev


# Install python ---------------------------------------------------------------

RUN apt-get update || apt-get update
RUN apt-get install -y python3-pip python3-dev
# RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install matplotlib
RUN pip3 install plotly
RUN pip3 install sklearn
RUN pip3 install jupyter
RUN pip3 install scipy
RUN pip3 install statsmodels
RUN pip3 install xgboost
RUN pip3 install seaborn
RUN pip3 install pdpbox
RUN pip3 install lime
RUN pip3 install eli5
RUN pip3 install shap


# Install needed R packages ---------------------------------------------------

RUN R -e 'install.packages("data.table", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("mlr", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("magrittr", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("ggplot2", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("xgboost", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("pdp", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("plotly", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("tidyverse", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("lime", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("xgboostExplainer", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("Matrix", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("aplpack", repos="http://cran.us.r-project.org", dependencies=TRUE)'

RUN R -e 'install.packages("glue", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("lubridate", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("repr", repos="http://cran.us.r-project.org", dependencies=TRUE)'
RUN R -e 'install.packages("devtools", repos="http://cran.us.r-project.org", dependencies=TRUE)'

RUN R -e 'devtools::install_github("IRkernel/IRkernel")'
RUN R -e 'IRkernel::installspec(name = "irbase", displayname = "R-base")'

WORKDIR /usr/local/notebooks
CMD ["jupyter", "notebook", "--no-browser", "--allow-root"]
