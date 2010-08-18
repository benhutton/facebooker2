module Facebooker2
  module Rails
    module Helpers
      module RequestForms
        ###
        # http://developers.facebook.com/docs/reference/fbml/req-choice
        # Facebook has planned to deprecate this tag
        # Specifies a button to be shown at the bottom of a request on the user's requests page.
        #
        def fb_req_choice(label,url)
          tag "fb:req-choice",:label=>label,:url=>url
        end

        ###
        # Creates a form that sends requests to the selected users.
        # The form is submitted after the user confirms the sending of the request.
        #
        def fb_request_form(type,url,message,options={},&block)
          content = capture(&block)
          concat(content_tag("fb:request-form", content.to_s + fb_forgery_protection_token_tag,
                    {:action=>url,:method=>"post",:invite=>true,:type=>type,:content=>message}.merge(options)))
        end

        ###
        # This is a nearly full-page interface intended to be used on canvas pages to allow the
        # user to send a "large" number of requests or invitations (where "large" is generally
        # some number more than 4). This tag must be used inside an fb:request-form tag.
        #
        def fb_multi_friend_selector(message,options={},&block)
          options = fb_stringify_vals({:showborder=>false,:actiontext=>message,:max=>20}.merge(options.dup))
          tag("fb:multi-friend-selector",options)
        end

        private
        ###
        # when forgery protection is enabled, add forgery protection hidden input
        #
        def fb_forgery_protection_token_tag
          unless protect_against_forgery?
            ''
          else
            tag(:input, :type => "hidden", :name => request_forgery_protection_token.to_s, :value => form_authenticity_token)
          end
        end

      end
    end
  end
end