{{- define "myapp.name" -}}
myapp
{{- end }}

{{- define "myapp.fullname" -}}
{{ include "myapp.name" . }}-{{ .Release.Name }}
{{- end }}
{{- define "myapp-chart.fullname" -}}
{{ include "myapp-chart.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "myapp-chart.name" -}}
myapp
{{- end }}

{{- define "myapp-chart.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "myapp-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "myapp-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
