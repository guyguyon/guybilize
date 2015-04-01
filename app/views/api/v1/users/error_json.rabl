object @user
node(:success) { false }
node(:messages) { @user.present? && @user.errors.present? ? @user.errors.full_messages : ['Undefine user'] }