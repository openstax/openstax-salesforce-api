class UpdateLeadsFromSalesforce

  def start_update
    update_leads
    create_new_leads
  end

  def update_leads
    #read data from salesforce
    @sf_leads ||= OpenStax::Salesforce::Remote::Lead
                      .where(source: "OSC Faculty")
                      .select(:id, :email)
                      .to_a

    @leads = Lead.all

    #update existing Leads
    @leads.each do |lead|
      sf_lead = sf_leads[email: lead.email]
      lead.first_name = sf_lead.first_name
      lead.last_name = sf_lead.last_name
      lead.salutation = sf_lead.salutation
      lead.subject = sf_lead.subject
      lead.school = sf_lead.school
      lead.phone = sf_lead.phone
      lead.website = sf_lead.website
      lead.status = sf_lead.status
      lead.email = sf_lead.email
      lead.source = sf_lead.source
      lead.newsletter = sf_lead.newsletter
      lead.newsletter_opt_in = sf_lead.newsletter_opt_in
      lead.adoption_status = sf_lead.adoption_status
      lead.num_students = sf_lead.num_students
      lead.os_accounts_id = sf_lead.os_accounts_id
      lead.accounts_uuid = sf_lead.accounts_uuid
      lead.application_source = sf_lead.application_source
      lead.role = sf_lead.role
      lead.who_chooses_books = sf_lead.who_chooses_books
      lead.verification_status = sf_lead.verification_status
      lead.finalize_educator_signup = sf_lead.finalize_educator_signup

      lead.save if lead.changed?

    end
  end

  def create_new_leads
    new_sf_leads = @sf_leads.reject { |s| @leads.include? s }

    #loop through new leads and save
    new_sf_leads.each do |sf_lead|
      new_lead = Lead.new(
        first_name: sf_lead.first_name,
        last_name: sf_lead.last_name,
        salutation: sf_lead.salutation,
        subject: sf_lead.subject,
        school: sf_lead.school,
        phone: sf_lead.phone,
        website: sf_lead.website,
        status: sf_lead.status,
        email: sf_lead.email,
        source: sf_lead.source,
        newsletter: sf_lead.newsletter,
        newsletter_opt_in: sf_lead.newsletter_opt_in,
        adoption_status: sf_lead.adoption_status,
        num_students: sf_lead.num_students,
        os_accounts_id: sf_lead.os_accounts_id,
        accounts_uuid: sf_lead.accounts_uuid,
        application_source: sf_lead.application_source,
        role: sf_lead.role,
        who_chooses_books: sf_lead.who_chooses_books,
        verification_status: sf_lead.verification_status,
        finalize_educator_signup: sf_lead.finalize_educator_signup
      )

      new_lead.save

      #handle errors
    end


  end


end