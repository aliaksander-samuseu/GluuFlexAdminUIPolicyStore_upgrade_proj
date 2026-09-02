@id("EditorCantEditAuthenticationServerConfiguration")
forbid (
  principal,
  action in GluuFlexAdminUI::Action::"write",
  resource in GluuFlexAdminUIResources::Features::"AuthenticationServerConfiguration"
)
when {
    context has tokens.gluuflexadminui_userinfo_token &&
    context.tokens.gluuflexadminui_userinfo_token.hasTag("jansAdminUIRole") &&
    context.tokens.gluuflexadminui_userinfo_token.getTag("jansAdminUIRole").contains("api-editor")
};