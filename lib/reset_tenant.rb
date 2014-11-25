
Scrivito::CmsRestApi.delete('workspaces', {
  tenant_name: Scrivito::Configuration.tenant,
  revision_id: Scrivito::Workspace.default.revision_id,
})
    
