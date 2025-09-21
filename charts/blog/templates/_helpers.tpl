{{- define "enviapp.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "enviapp.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{- define "enviapp.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

