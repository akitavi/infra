{{- define "t-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "t-api.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "t-api.labels" -}}
app.kubernetes.io/name: {{ include "t-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{- end -}}

{{- define "t-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "t-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "t-api.secretName" -}}
{{- if .Values.secrets.name -}}
{{ .Values.secrets.name }}
{{- else -}}
{{ include "t-api.fullname" . }}-secret
{{- end -}}
{{- end -}}

