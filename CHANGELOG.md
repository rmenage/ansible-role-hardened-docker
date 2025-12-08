<!-- insertion marker -->
## [0.4.1](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.4.1) - 2025-12-03

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/6988ab8bb921645a9687933b268c7138e369bba7...0.4.1)</small>

## [0.4.0](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.4.0) - 2025-12-03

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/fc34d206ad3bf589cb225029d6c12583eb95c46e...0.4.0)</small>

### Docs

- add Rocky as supported platform ([b1e95b5](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/b1e95b5fdeb856b1c6be81181bf5d91d878c36ca) by Rija Ménagé).

### Bug Fixes

- restore encryption of the generated RSA private key for CA cert ([fa366d0](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/fa366d0f797870eaffef6c4b347ed955d2d25ebe) by Rija Ménagé). Refs: 68e5dd0604c8388b3e66fc9f0705086d426fe5a9

### Features

- add matrix expression for running test on two OSes in parallel ([fc34d20](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/fc34d206ad3bf589cb225029d6c12583eb95c46e) by Rija Ménagé).

## [0.3.1](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.3.1) - 2025-12-03

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/42ccfcdd6389ec6ff98a9a51ce6a13eb5f712a66...0.3.1)</small>

### Docs

- change docs update date ([b6f0937](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/b6f09376f30b066590cf35b7ce6f9ce9fdcffc95) by Rija Ménagé).
- add changelog entry ([efb665f](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/efb665f4ba15e38819456c6358e0e65bba80f193) by Rija Ménagé).
- update docs ([42ccfcd](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/42ccfcdd6389ec6ff98a9a51ce6a13eb5f712a66) by Rija Ménagé).

## [0.3.0](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.3.0) - 2025-12-03

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/9e06d75dde3e0a559dc0441708fffd3695b5c510...0.3.0)</small>

### Docs

- update Contributing doc ([7879e54](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/7879e54e93fd53fb6aa5dc9a72f7b3bd6275ecd0) by Rija Ménagé).
- change username, generate README with docsible, add changelog item ([2c6a40a](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/2c6a40a5ac9c7bb9a2e021b57132cacbebf4f10c) by Rija Ménagé).
- improve accuracy of license and codeowners ([9e06d75](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/9e06d75dde3e0a559dc0441708fffd3695b5c510) by Rija Ménagé).

### Bug Fixes

- pin down dependencies version for reproducibility ([c8daab8](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/c8daab83b4ceecdacddfb6a1f7c61863e0f598e4) by Rija Ménagé).
- remove diagram as they are confusing ([34d5203](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/34d5203bf62a81136b9ffb7971a4f630ef9bdd8d) by Rija Ménagé).

### Features

- also delete the passphrase file ([20a2da1](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/20a2da16919ad4e1e736b5522a921b7e68a04a75) by Rija Ménagé).
- add cleanup task to delete intermediary files ([65f631f](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/65f631fc75e52757b3459bbfb2187528275f6819) by Rija Ménagé).

## [0.2.0](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.2.0) - 2025-12-03

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/3447ce778c2189f7f0ac1ffe1f9e3c9d5afbfe31...0.2.0)</small>

### Docs

- add changelog entry ([7468a6c](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/7468a6c44e12a3b9d6823c4a1b78911cc56419da) by Rija Ménagé).

### Bug Fixes

- correct typo ([d0d51d8](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/d0d51d83b8a9bb63cd9e6958267351dad37675b0) by Rija Ménagé).
- remove useless change_when parameter as creates does the job ([3c2adc8](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3c2adc84180d73459677bd673e05cc9f014fdeac) by Rija Ménagé).
- refactor how ansible know certificate task is changed ([78986f2](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/78986f2f778dce9be9df726d8bb0d166ea6d18d0) by Rija Ménagé).
- remove most warnings thrown by running molecule test ([0261ceb](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/0261ceb2a0e7ea25e2a64201e22ebf3b22362588) by Rija Ménagé).
- correct quoting error ([f3049b3](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/f3049b3fa1cf5d4043d8fb271c766fdc51983b34) by Rija Ménagé). "x509: subject name is expected to be in the format /type0=value0/type1=value1/type2=... where characters may be escaped by \\. This name is not in that format: ''/C=XX/ST=Default State/L=Default City/O=Default Company/CN=127.0.0.1''"
- revert yamllint config on line length and update CA task with argv ([e0947a2](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/e0947a2d3eb3387f3f241ce0a27173c0e4ad9945) by Rija Ménagé).
- apply yamllint warning fixes to generate_server_cert.yml ([506b010](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/506b01097374f83ca0dd71d49aca29949a4ac7be) by Rija Ménagé).
- apply yamllint warning fixes to generate_client_cert.yml ([66c5204](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/66c52046447eadcf45d4fb49cf023c6579a73df6) by Rija Ménagé).
- apply yamllint warning fixes to generate_ca_cert.yml ([3bc61e7](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3bc61e733a3d8d0280f435683d7bbf8de1e382d8) by Rija Ménagé).
- apply ansible lint suggestions for jinja2 formatting ([3447ce7](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3447ce778c2189f7f0ac1ffe1f9e3c9d5afbfe31) by Rija Ménagé).

### Features

- refactor to have change detection based on file existence ([a4409a3](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/a4409a3168a2ea7ded615b8aed7ec421b25c493d) by Rija Ménagé).
- add Coderabbit config and fix spacing warnings in molecule config ([3c391f3](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3c391f3c5b2b4a7218ba515d1e74bdcd39cebd29) by Rija Ménagé).
- implement verify tasks in molecule test ([fc14ab7](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/fc14ab7824a35b3a30e22bb22e85e282a7d4f1f5) by Rija Ménagé).

## [0.1.0](https://gitlab.com/rmenage/ansible-role-hardened-docker/tags/0.1.0) - 2025-12-01

<small>[Compare with first commit](https://gitlab.com/rmenage/ansible-role-hardened-docker/compare/4c703e5b93686eaed7091887c36430a5a73ec73c...0.1.0)</small>

### Docs

- remove redundant backticks ([6d13633](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/6d13633223da0d501160862d67867b2b8fc25ff9) by Rija Ménagé).
- add entry to the CHANGELOG ([3d43613](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3d43613127118d4050e71a5259b4c0a1619db636) by Rija Ménagé).
- update the README ([1efcd6f](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/1efcd6f8b90d1be0d66d1e0f82558aeabf71e9a2) by Rija Ménagé).
- tweak the role manifest to match currently supported platform ([e1c236c](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/e1c236c12e01a540d391adf07f6d51a720ed9601) by Rija Ménagé).
- add changelog entry ([eb1f899](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/eb1f899281b466ea3cfe8e8f282ecfd1ffcf7cbb) by Rija Ménagé).
- Fill in the contributing guide ([95b9cf6](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/95b9cf61884af1a5f23cde76dd90d8d843528295) by Rija Ménagé).
- add changelog entry for linting update ([31a7aae](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/31a7aaed463d3d9db30e36b419b800a51afbdd37) by Rija Ménagé).
- Various admin tweaks to code docs ([e9d7270](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/e9d7270767b1c7a3539e16e4c7aa52ca06436f7a) by Rija Ménagé).
- add changelog ([6ec8179](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/6ec8179232481cddd059ef06f3b8e67fd6d31377) by Rija Ménagé).
- add license ([0cdfa17](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/0cdfa17464c6b67c3ed1581201b234e8fc79cde6) by Rija Ménagé).

### Bug Fixes

- move docker:dind to the only job that needs it ([9d7eb48](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/9d7eb48682266c59cb8ed859d2fe8fb8293772eb) by Rija Ménagé).
- rename the molecule job to be more generic and remove verbosity ([49ec1a1](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/49ec1a15d65761266aab587c8af032f5c514aba4) by Rija Ménagé).
- add community.general to the list of required ansible collections ([815f546](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/815f54643f472c0812e631477b03398266bd8c36) by Rija Ménagé).
- address incorrect name of depended upon role ([c73da76](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/c73da76b7eb66950fe07af1ca7ecbe40e15e1542) by Rija Ménagé).
- install required ansible roles and collection ([59ad1e0](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/59ad1e089b57a7a43343af7d991d5ac00d1998a1) by Rija Ménagé).
- use venv approach for python dependencies in docker ([eb52e0e](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/eb52e0e38c3c623eab9628486ceaf3062e6127b0) by Rija Ménagé).
- replace pip with pipx ([5dbcc36](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/5dbcc363cd2a55f54a3703fb399d5bca635a0551) by Rija Ménagé).
- install pip and other useful tools ([3c98c4c](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3c98c4ca1bc8c656105ad2b13f0cd846572fc2c7) by Rija Ménagé).
- use docker image in job ([a2d50a2](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/a2d50a2fc5dfa90680ca245663af294f999e8508) by Rija Ménagé).
- try to get dind working ([07004cb](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/07004cbef55b344f69123c37a6bc52fd4764c199) by Rija Ménagé).
- enable docker:dind gitlab service for molecule docker driver ([15560b6](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/15560b6e22271a7878c887c24d2bb83a0fbf07d8) by Rija Ménagé).
- add missing molecule docker driver to CI ([c7c48f8](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/c7c48f83bc921f80fe87dc84e5018cafc1c1c83d) by Rija Ménagé).
- add notify to tasks that return changed state and reorder systemd's ([11332f4](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/11332f484d700d8b12eee41eb715a9130a6da379) by Rija Ménagé).
- use python 3.13 in CI to work around job error ([5353966](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/535396609bd6968f57afcc72504b46a68ea21064) by Rija Ménagé).
- make cert creation idempotent ([e8f4bf3](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/e8f4bf3c127ad37c2d0f3c236c4b722fe13fa52d) by Rija Ménagé).
- fix broken errors found by yamllint ([7bc5443](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/7bc5443af94a37ed81160928835e32e176fdfee4) by Rija Ménagé).
- fix a FQCN error reported by ansible-lint ([37b75b9](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/37b75b9b44e68090f3dcfecef5918587576b8eac) by Rija Ménagé).
- correct typo in role name ([f839557](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/f839557d63f4f664f35bf82a639084e880623827) by Rija Ménagé).
- configure ansible-lint and fix errors it found ([cfe2b05](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/cfe2b05f9adbb3cb9ac40e67b56c495401f71432) by Rija Ménagé).
- ensure python image is used in gitlab job ([7e70612](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/7e70612ae0f7fde31aa77680fa170f51ca132097) by Rija Ménagé).
- update yamllint cfg to match ansible-lint cfg, fix more errors ([268683a](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/268683a0d576e4114f9602435fe45e70b1c67fb6) by Rija Ménagé).
- ran yamllint and fix errors it found ([8cfc52f](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/8cfc52f247b1ed21bc9fe570635fd5228a692aa1) by Rija Ménagé).
- update meta main with compliant role name and issue tracker link ([a6947f1](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/a6947f1c32823b89057aa7b5f1766858542b6ca7) by Rija Ménagé).
- correct path to template path ([e48a2a7](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/e48a2a7085899667a4170aea247c8c04dcfa58da) by Rija Ménagé).
- correct name of tcp listener task to match referenced name in main ([2863a15](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/2863a15ed8f133dd4abf2e328a36ecfe599a315c) by Rija Ménagé).
- remove role name prefix when notify to handler ([cf2995e](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/cf2995e5256036b9fb322caf12e1205a04006b57) by Rija Ménagé).
- replace variable name prefix ([adc4505](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/adc4505dbbb073b151d737d11abf65db922f9b83) by Rija Ménagé).
- replace import_tasks with include_tasks ([9c373c0](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/9c373c0bea1fd38b55458f49f1ce22b498735478) by Rija Ménagé).

### Features

- add Gitlab job for running molecule tests ([38a63d4](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/38a63d408839671c1b603176e6c4f7a2a3c75c1e) by Rija Ménagé).
- add pre-commit hook to run linter ([8c6b513](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/8c6b5135f18a6dc100ee915200d88da964d46b68) by Rija Ménagé).
- configure molecule correctly ([4c703e5](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/4c703e5b93686eaed7091887c36430a5a73ec73c) by Rija Ménagé).
- check that docker and systemd prerequisites are satisfied ([3be185a](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/3be185a85fdcd6d851b6e9d6d6d10977a92561a4) by Rija Ménagé). Related issues/PRs: [#1](https://gitlab.com/rmenage/ansible-role-hardened-docker/issues/1)
- make explicit what is allowed to express truthy in role ([84361e4](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/84361e474b6ce6a80c4a3b7b6d6b7df19c9afb53) by Rija Ménagé).
- add ansible-lint in linting gitlab job ([9ef2982](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/9ef29823b5800f66f97641aa2f2c4899611ed6cf) by Rija Ménagé).
- add gitlab job to run yamllint ([6c3eae9](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/6c3eae90ada959722644e7e8af0b6b6fa0dc6746) by Rija Ménagé).
- add .gitnore for local ansible config directory ([570da23](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/570da23aa34d78eb1b91dbed1612a87e1475e80e) by Rija Ménagé).
- add molecule test directory ([2325298](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/2325298454eb9bc62ca14b7d0588178f4d5551fe) by Rija Ménagé).
- add homebrew dependencies for developing ansible role ([cc69278](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/cc69278d70536aaeaba2da7ed8d16a215a7d3ade) by Rija Ménagé).
- first commit ([760620c](https://gitlab.com/rmenage/ansible-role-hardened-docker/commit/760620c6b869d09db0748498e90eb5d9ae7e9c77) by Rija Ménagé).
