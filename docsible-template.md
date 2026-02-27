
# 📃 Role overview

![CI/CD](https://gitlab.com/rmenage/ansible-role-hardened-docker/badges/main/pipeline.svg)

{% if role.docsible -%}
| Field                | Value           |
|--------------------- |-----------------|
{%- if role.docsible.description %}
| Functional description | {{ role.docsible.description }} |
{%- endif %}
{%- if role.docsible.requester %}
| Requester            | {{ role.docsible.requester }} |
{%- endif %}
{%- if role.docsible.users %}
| Users                | {{ role.docsible.users }} |
{%- endif %}
{%- if role.docsible.dt_dev %}
| Date dev             | {{ role.docsible.dt_dev }} |
{%- endif %}
{%- if role.docsible.dt_prod %}
| Date prod            | {{ role.docsible.dt_prod }} |
{%- endif %}
{%- if role.docsible.dt_update %}
| Readme update        | {{ role.docsible.dt_update }} |
{%- endif %}
{%- if role.docsible.version %}
| Version              | {{ role.docsible.version }} |
{%- endif %}
{%- if role.docsible.time_saving %}
| Time Saving          | {{ role.docsible.time_saving }} |
{%- endif %}
{%- if role.docsible.category %}
| Category             | {{ role.docsible.category }} |
{%- endif %}
{%- if role.docsible.subCategory %}
| Sub category         | {{ role.docsible.subCategory }} |
{%- endif %}
{%- if role.docsible.aap_hub %}
| AAP Hub              | {{ role.docsible.aap_hub }} |
{%- endif %}
{%- if role.docsible.automation_kind %}
| Automation Kind      | {{ role.docsible.automation_kind }} |
{%- endif %}
{%- if role.docsible.critical %}
| Critical ⚠️          | {{ role.docsible.critical }} |
{%- endif %}
{%- endif %}


## {{ role.name }}

{% if role.belongs_to_collection -%}
```
Role belongs to {{ role.belongs_to_collection.namespace }}/{{ role.belongs_to_collection.name }}
Namespace - {{ role.belongs_to_collection.namespace }}
Collection - {{ role.belongs_to_collection.name }}
Version - {{ role.belongs_to_collection.version }}
Repository - {{ role.belongs_to_collection.repository }}
```
{%- endif %}

{% if role.meta and role.meta.galaxy_info -%}
{%- if role.meta.galaxy_info.description and (role.meta.galaxy_info.description is not string and role.meta.galaxy_info.description is not mapping) -%}
Description:
{% for role_desc in role.meta.galaxy_info.description -%}
  - {{ role_desc }}
{% endfor -%}
{%- else -%}
Description: {{ role.meta.galaxy_info.description or 'Not available.' }}
{%- endif %}
{%- endif %}

{% macro render_arguments_list(arguments, level=0) %}
{% for arg, details in arguments.items() %}
  {%- set indent = '  ' * level %}
  {{ indent }}- **{{ arg }}**
  {{ indent }}  - **Required**: {{ details.required | default('false') }}
  {{ indent }}  - **Type**: {{ details.type }}
  {{ indent }}  - **Default**: {{ details.default | default('none') }}
  {% if details.description is iterable and (details.description is not string and details.description is not mapping) -%}
  {{ indent }}  - **Description**: 
  {% for details_desc in details.description -%}
      {{ indent }} - {{ details_desc }}
  {% endfor -%}
  {% else %}
  {{ indent }}  - **Description**: {{ details.description | default('No description provided') }}
  {%- endif %}
  {% if details.choices is defined %}
    {{ indent }}  - **Choices**:
    {% for choice in details.choices %}
      {{ indent }}    - {{ choice }}
    {% endfor %}
  {% endif %}
  {% if details.aliases is defined %}
    {{ indent }}  - **Aliases**:
    {% for alias in details.aliases %}
      {{ indent }}    - {{ alias }}
    {% endfor %}
  {% endif %}
  {% if details.type == 'dict' and details.options %}
    {{ render_arguments_list(details.options, level + 1) }}
  {% elif details.type == 'list' and details.elements == 'dict' %}
    {% for elem in details.default %}
      {% if elem is mapping %}
        {{ render_arguments_list(elem, level + 1) }}
      {% endif %}
    {% endfor %}
  {% endif %}
{% endfor %}
{% endmacro %}

{% if role.argument_specs %}
<details>
<summary><b>🧩 Argument Specifications in meta/argument_specs</b></summary>
{% for section, specs in role.argument_specs.argument_specs.items() %}
#### Key: {{ section }}
{% if specs.description is iterable and (specs.description is not string and specs.description is not mapping) %}
**Description**: 
{% for desc in specs.description -%}
  - {{ desc }}
{% endfor -%}
{% else %}
**Description**: {{ specs.description or specs.short_description or 'No description provided' }}
{%- endif %}

{% if specs.options is defined -%}
**Options**:
{{ render_arguments_list(specs.options) }}
{%- endif %}
{% endfor %}
</details>
{% else %}
{% endif %}

{% macro render_repo_link(repo, role_name, file_path, line, repo_type, branch) -%}
  {%- if repo and file_path and line is not none -%}
    {%- if role.belongs_to_collection -%}
      {%- set full_path = 'roles/' ~ role_name ~ '/' ~ file_path -%}
    {%- else -%}
      {%- set full_path = file_path -%}
    {%- endif %}
    {%- set encoded_path = full_path | replace(' ', '%20') -%}

    {%- if repo_type == 'github' -%}
      {{ repo }}/blob/{{ branch }}/{{ encoded_path }}#L{{ line }}
    {%- elif repo_type == 'gitlab' -%}
      {{ repo }}/-/blob/{{ branch }}/{{ encoded_path }}#L{{ line }}
    {%- elif repo_type == 'gitea' -%}
      {{ repo }}/src/branch/{{ branch }}/{{ encoded_path }}#L{{ line }}
    {%- else -%}
      {{ repo }}/{{ encoded_path }}#L{{ line }}
    {%- endif %}
  {%- else -%}
    {{ file_path }}#L{{ line }}
  {%- endif %}
{%- endmacro %}

{% if role.playbook.content -%}

## How to install

```
ansible-galaxy role install {{ role.meta.galaxy_info.author }}.{{ role.meta.galaxy_info.role_name }}
```
## Playbook

```yml
{{ role.playbook.content }}
```
{%- endif %}
{% if role.playbook.graph -%}
## Playbook graph
```mermaid
{{ role.playbook.graph }}
```
{%- endif %}


{% if role.defaults|length > 0 -%}

### Defaults

**These are static variables with lower priority**
{%- for defaultfile in role.defaults|sort(attribute='file') %}

#### File: defaults/{{ defaultfile.file }}
{# Cycle used for deciding to set Title and Required Column #}
{% set ns = namespace(details_required = false, details_title = false, details_choices = false) %}
{%- for key, details in defaultfile.data.items() -%}
    {%- if details.required is not none -%}{%- set ns.details_required = true -%}{%- endif -%}
    {%- if details.title is not none -%}{%- set ns.details_title = true -%}{%- endif -%}
    {%- if details.choices != None -%}{%- set ns.details_choices = true -%}{%- endif -%}
{%- endfor -%}
| Var          | Type         | Value       |{% if ns.details_choices %}Choices    |{% endif %}{% if ns.details_required %}Required    |{% endif %}{% if ns.details_title %} Title       |{% endif %}
|--------------|--------------|-------------|{% if ns.details_choices %}-----------|{% endif %}{% if ns.details_required %}------------|{% endif %}{% if ns.details_title %}-------------|{% endif %}
{%- for key, details in defaultfile.data.items() %}
{%- set var_type = details.value.__class__.__name__ %}
{%- if '.' in key %}
| [{{ key.rsplit('.', 1)[0] ~ '.**' ~ key.rsplit('.', 1)[1] ~ '**' }}]({{ render_repo_link(role.repository, role.name, 'defaults/' ~ defaultfile.file, details.line, role.repository_type, role.repository_branch) }})   | {{ var_type }} | {% if details.value is string and details.value | length == 0 %}{% else %}`{{ details.value | replace('|', '¦') }}`{% endif %} | {% if ns.details_choices %} {{ details.choices | replace('|', '¦') }}  |{% endif %}  {% if ns.details_required %} {{ details.required }}  |{% endif %} {% if ns.details_title %} {{ details.title | replace('|', '¦') }} |{% endif %}
{%- else %}
| [{{ key }}]({{ render_repo_link(role.repository, role.name, 'defaults/' ~ defaultfile.file, details.line, role.repository_type, role.repository_branch) }})   | {{ var_type }} | {% if details.value is string and details.value | length == 0 %}{% else %}`{{ details.value | replace('|', '¦') }}`{% endif %} | {% if ns.details_choices %} {{ details.choices | replace('|', '¦') }}  |{% endif %}  {% if ns.details_required %} {{ details.required }}  |{% endif %} {% if ns.details_title %} {{ details.title | replace('|', '¦') }} |{% endif %}
{%- endif %}
{%- endfor %}
{%- endfor %}

{%- for defaultfile in role.defaults|sort(attribute='file') -%}
{%- set ns = namespace(has_descriptions = false) -%}
{%- for key, details in defaultfile.data.items() -%}
    {%- if details.description != None -%}{%- set ns.has_descriptions = true -%}{% endif -%}
{%- endfor -%}
{%- if ns.has_descriptions %}
<details>
<summary><b>🖇️ Full descriptions for vars in defaults/{{ defaultfile.file }}</b></summary>
<br>
<table>
<th>Var</th><th>Description</th>
{%- for key, details in defaultfile.data.items() %}
    {%- if details.description != None %}
<tr><td><b>{{ key }}</b></td><td>{{details.description }}</td></tr>
    {%- endif %}
{%- endfor %}
</table>
<br>
</details>
{%- endif %}
{%- endfor %}
{%- else %}
{%- endif %}

{% if role.meta.galaxy_info -%}
## Author Information
{{ role.meta.galaxy_info.author or 'Unknown Author' }}

#### License

{{ role.meta.galaxy_info.license or 'No license specified.' }}

#### Minimum Ansible Version

{{ role.meta.galaxy_info.min_ansible_version or 'No minimum version specified.' }}

#### Platforms

{% if role.meta.galaxy_info.platforms -%}
{% for platform in role.meta.galaxy_info.platforms -%}
- **{{ platform.name }}**: {{ platform.versions }}
{% endfor -%}
{%- else -%}
No platforms specified.
{%- endif %}
{%- endif %}
