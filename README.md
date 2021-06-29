# README

Working through Hadley Wickham's *Mastering Shiny*.

## `renv`

This project also uses `renv` to manage the environment.

Documentation is available here:

- [Introduction to renv](https://rstudio.github.io/renv/articles/renv.html)

### Basic workflow for renv

> The general workflow when working with renv is:
> 
> Call renv::init() to initialize a new project-local environment with a private R library,
> 
> Work in the project as normal, installing and removing new R packages as they are needed in the
> project,
> 
> Call renv::snapshot() to save the state of the project library to the lockfile (called renv.lock),
> 
> Continue working on your project, installing and updating R packages as needed.
> 
> Call renv::snapshot() again to save the state of your project library if your attempts to update R
> packages were successful, or call renv::restore() to revert to the previous state as encoded in 
> the lockfile if your attempts to update packages introduced some new problems.
>
> --- [Kevin Ushey, Introduction to renv](https://rstudio.github.io/renv/articles/renv.html)
