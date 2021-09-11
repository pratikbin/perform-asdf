# perform-asdf

asdf-as-a-package-manager maybe

### Note: add `.asdf` in `.gitignore`

as we checkout `.asdf` repo and since gh actions does not let us checkout outside of `/home/runner/work/<org>/<repo>/` so
we have to checked it out at `/home/runner/work/<org>/<repo>/`

## Usage

**main** branch will always be stable

- list new line seprated plugins in `with.thses` with below pattern
  `<plugin-name> <plugin-version> <plugin-url>`


```yaml
      ## checkout asdf
      - name: Checkout tools repo
        uses: actions/checkout@v2
        with:
          repository: asdf-vm/asdf
          path: .asdf
          ref: 'v0.8.1'

      ## enable plugin
      - name: Install plugins
        uses: pratikbalar/perform-asdf@main
        with:
          these: |
            terraform 1.0.6 https://github.com/asdf-community/asdf-hashicorp.git
            redis-cli 6.2.5 https://github.com/NeoHsu/asdf-redis-cli.git

      - name: Test installations
        run: |
          . .asdf/asdf.sh
          terraform --version
          redis-cli --version
```

- Read plugin docs for more configurations like java plugin required shell initilization read more
<https://github.com/halcyon/asdf-java#java_home>

- must add `. .asdf/asdf.sh` in run to use asdf installed plugins unless you want to use default versions
that come with runner
