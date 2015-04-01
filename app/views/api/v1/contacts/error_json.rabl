object @contact
node(:success) { false }
node(:messages) { @contact.present? && @contact.errors.present? ? @contact.errors.full_messages : ['Undefine contact'] }