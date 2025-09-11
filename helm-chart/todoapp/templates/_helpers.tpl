{{- define "todoapp.fullname" -}}
{{ .Chart.Name }}-{{ .Release.Name }}
{{- end -}}
