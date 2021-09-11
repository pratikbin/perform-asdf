# perform-asdf

asdf-as-a-pkg-manager maybe

### Note: add `.asdf` in `.gitignore`

as we checkout .asdf in repo since gh actions does not let us checkout outside of `'/home/runner/work/<org>/<repo>/`

## Usage

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
        uses: pratikbalar/perform-asdf
        with:
          these: |
            terraform 1.0.6 https://github.com/asdf-community/asdf-hashicorp.git
            java openjdk-10 https://github.com/halcyon/asdf-java.git

      - name: Test installations
        run: |
          terraform --version
          java -version
```
