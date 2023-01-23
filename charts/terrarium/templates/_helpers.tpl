{{/*
Expand the name of the chart.
*/}}
{{- define "terrarium.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "terrarium.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "terrarium.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "terrarium.labels" -}}
helm.sh/chart: {{ include "terrarium.chart" . }}
{{ include "terrarium.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "terrarium.selectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.modulesAPIV1SelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-modules-api-v1
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.browseSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-browse
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.gatewaySelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.registrarSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-registrar
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.dependencyManagerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-dependency
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.versionManagerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-version-manager
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.storageSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-storage
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.webSelectorLabels" -}}
app.kubernetes.io/name: {{ include "terrarium.name" . }}-web-ui
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "terrarium.otelEndpoint" -}}
{{- if .Values.otelTraceEndpoint }}
- name: OTEL_EXPORTER_OTLP_ENDPOINT
  value: {{ .Values.otelTraceEndpoint }}
{{- end }}
{{- end }}