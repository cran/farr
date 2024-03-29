% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_parquet.R
\name{load_parquet}
\alias{load_parquet}
\title{Function to load parquet file into database.}
\usage{
load_parquet(conn, table, schema = "", data_dir = Sys.getenv("DATA_DIR"))
}
\arguments{
\item{conn}{DuckDB connection}

\item{table}{Name of table to be loaded}

\item{schema}{Database schema for table}

\item{data_dir}{Directory for data repository}
}
\value{
Remote data frame in conn
}
\description{
Function to read data from a parquet file data_dir/schema/table_name.parquet
into a table in the DuckDB database at conn.
}
