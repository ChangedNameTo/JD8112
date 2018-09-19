module Roles
  roles = [
    {
      label: "System Admin",
      description: "Super user, given only to people who can manage the entire system (Team JD8112)."
    },
    {
      label: "Expo Admin",
      description: "Expo admin, for all intents will be identical to system admin."
    },
    {
      label: "Team Member",
      description: "Manages their own project at a fair. Can edit descriptions of their own projects."
    }
  ]

  roles.each do |role|
    Role.find_or_create_by!(role)
  end
end
