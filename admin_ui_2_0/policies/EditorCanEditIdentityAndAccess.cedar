@id("EditorCanEditIdentityAndAccess")
permit (
  principal,
  action in [GluuFlexAdminUI::Action::"read",
  GluuFlexAdminUI::Action::"write"],
  resource in GluuFlexAdminUIResources::ParentResource::"IdentityAndAccess"
)
when {
    context has tokens.gluuflexadminui_userinfo_token &&
    context.tokens.gluuflexadminui_userinfo_token.hasTag("jansAdminUIRole") &&
    context.tokens.gluuflexadminui_userinfo_token.getTag("jansAdminUIRole").contains("api-editor")
};