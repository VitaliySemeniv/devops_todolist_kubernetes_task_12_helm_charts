{{/*
Expand the name of the chart.
*/}}
{{- define "mysql.name" -}}
mysql
{{- end }}

{{/*
Create a default fully qualified mysql name.
*/}}
{{- define "mysql.fullname" -}}
{{ printf "%s-%s" .Release.Name "mysql" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Chart name and version.
*/}}
{{- define "mysql.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
