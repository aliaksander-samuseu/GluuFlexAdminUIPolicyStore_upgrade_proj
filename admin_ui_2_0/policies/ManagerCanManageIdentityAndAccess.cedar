@id("ManagerCanViewIdentityAndAccess")
permit (
  principal,
  action in GluuFlexAdminUI::Action::"read",
  resource in GluuFlexAdminUIResources::ParentResource::"IdentityAndAccess"
)
when {
    context has tokens.gluuflexadminui_userinfo_token &&
    context.tokens.gluuflexadminui_userinfo_token.hasTag("jansAdminUIRole") &&
    context.tokens.gluuflexadminui_userinfo_token.getTag("jansAdminUIRole").contains("api-editor")
};

@id("ManagerCanModifyIdentityAndAccess")
permit (
  principal,
  action in [GluuFlexAdminUI::Action::"write",
  GluuFlexAdminUI::Action::"delete"],
  resource in GluuFlexAdminUIResources::ParentResource::"IdentityAndAccess"
)
when {
    context has tokens.gluuflexadminui_userinfo_token &&
    context.tokens.gluuflexadminui_userinfo_token.hasTag("jansAdminUIRole") &&
    context.tokens.gluuflexadminui_userinfo_token.getTag("jansAdminUIRole").contains("api-manager")
};