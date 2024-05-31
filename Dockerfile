FROM python:3.8.6

RUN apt-get update && \
    apt-get install -y git r-base texinfo

RUN pip install numpy scipy

RUN cd / && \
    git clone https://bitbucket.org/liulab/mageck.git && \
    mv mageck /app

WORKDIR /app

RUN python setup.py install
RUN mageck --version

RUN R -e "install.packages('knitr', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('tidyr', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('pheatmap', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('ggplot2', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('gplots', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('xtable', repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('RColorBrewer', repos='http://cran.rstudio.com/')"
