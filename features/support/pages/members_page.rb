class MembersPage
  include PageObject
  link :to_members_list, id: 'tab-members'
  link :add_new_member, xpath: "//*[@id='tab-content-members']/p/a"
  text_field :add_member, id: 'principal_search'
  checkbox :members_list , id: 'principals'
  checkbox :members_roles, xpath: "//*[@id='new_membership']/fieldset[2]/div/label[1]/input"
  button :submit, id:'member-add-submit'
  table :list_members_table, xpath: ".//*[@id='tab-content-members']"
  link :edit_member, xpath: "(.//*[@class='icon icon-edit'])[1]"
  checkbox :developer_role, xpath: "(.//input[@value='4'])"
  button :save_changes, xpath: "(.//*[@class='small'])[2]"

  def adding_new_member (user)
    add_new_member
    add_member_element.when_visible
    add_member
    self.add_member = user
    sleep (3)
    check_members_list
    check_members_roles
    submit
  end

  def editing_users_roles
    edit_member
    check_developer_role
    save_changes
  end
end