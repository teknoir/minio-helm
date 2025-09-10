
{{/*
Returns the available value for certain key in an existing secret (if it exists),
otherwise it generates a random value.
*/}}
{{- define "minio.getValueFromSecret" }}
  {{- $len := (default 16 .Length) | int -}}
  {{- $obj := (lookup "v1" "Secret" .Namespace .Name).data -}}
  {{- if $obj }}
    {{- index $obj .Key | b64dec -}}
  {{- else -}}
    {{- randAlphaNum $len -}}
  {{- end -}}
{{- end }}

{{- define "minio.root.username" -}}
  {{- if .Values.rootUser }}
    {{- .Values.rootUser | toString }}
  {{- else }}
    {{- include "minio.getValueFromSecret" (dict "Namespace" .Release.Namespace "Name" "minio-secret" "Length" 20 "Key" "rootUser") }}
  {{- end }}
{{- end -}}

{{- define "minio.root.password" -}}
  {{- if .Values.rootPassword }}
    {{- .Values.rootPassword | toString }}
  {{- else }}
    {{- include "minio.getValueFromSecret" (dict "Namespace" .Release.Namespace "Name" "minio-secret" "Length" 40 "Key" "rootPassword") }}
  {{- end }}
{{- end -}}
