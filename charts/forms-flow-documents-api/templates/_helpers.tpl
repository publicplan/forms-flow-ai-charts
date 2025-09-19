{{- define "Values.extractKeyValuePairs" -}}
{{- $config := .Values.extraEnv }}
{{- with $config -}}
{{- range $key, $value := $config }}
- name: {{ $key }}
  value: {{ quote $value }}
{{- end }}
{{- end }}
{{- end }}

{{- define "Values.extractKeyValuePairsForYaml" -}}
{{- $config := .Values.extraEnv }}
{{- with $config -}}
{{- range $key, $value := $config }}
{{ $key }}: {{ quote $value }}
{{- end }}
{{- end }}
{{- end }}

{{- define "Values.extractKeyValuePairsForJson" -}}
{{- $config := .Values.extraEnv }}
{{- if $config -}}
{
{{- $first := true }}
{{- range $key, $value := $config }}
{{- if not $first }},{{ end }}
  {{ quote $key }}: {{ quote $value }}
{{- $first = false }}
{{- end }}
}
{{- end }}
{{- end }}