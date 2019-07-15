# HIMANIS project landing page

## Usage with Docker

A Dockerfile is provided to run a Nginx server with the generated site. Hugo is run at image build time.

The following will build the image and run it locally on port 8080 :

``` bash
docker build -t himanis-landing .
docker run -p 8080:80 himanis-landing
```

The Hugo base URL, used for all hyperlinks, can be set using the `HUGO_BASEURL` environment variable at build time. By default, the base URL is empty, meaning all links start from the current site root.

## Editing the content

The `config.toml` configuration file should provide enough settings to apply edits to text, images or Font Awesome icons.

To reorganize sections, edit the `index.html` file under `themes/hugo-agency-theme/layouts`. The instructions between double brackets `{{ }}` indicate Hugo instructions. Most of the index file contains `partial` instructions, which load HTML files under the `partials` folder.

To edit sections in HTML, look at the HTML file name written in the corresponding `partial` instruction in `index.html`, then edit it in the `partials` folder.

## Publishing the content

```bash
docker login registry.gitlab.com # only once
docker build -t registry.gitlab.com/arkindex/himanis-landing:latest .
docker push registry.gitlab.com/arkindex/himanis-landing:latest
```

Then use the **architecture** deployment Makefile.

## Related documentations

* [Getting Started](https://gohugo.io/getting-started/) with Hugo
* [Hugo Agency theme's README](https://github.com/digitalcraftsman/hugo-agency-theme/blob/master/README.md)

