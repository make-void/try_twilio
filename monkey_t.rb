require "roda"
require 'twilio-ruby'

CONTRACT_INFOS = { numDigits: '2', action: '/contract_infos', method: 'post', timeout: 5 }

# MonkeyT - the smart monkey

Resp = Twilio::TwiML::Response


#  `ruby murk_t.rb`


class MonkeyT < Roda
  plugin :indifferent_params

  route do |r|
    response['Content-Type'] = 'application/xml'

    r.root do
      Resp.new do |r|
        r.Gather CONTRACT_INFOS do |g|
          r.Say 'Hi, this is the block chain reporter speaking, Please enter or say the Smart Contract number you want to look up.'
        end
      end.text
    end

    def lookup_contract(id)
      {
        state: "confirmed",
        name: "CORP123",
        cgi:  "12345",
        block_hash: "669fbff977bc46509bab8e19cb6d29bc748c6c5b2347a21cb3fb4cf889279bb2",
        transaction_id: "0e5f334d876228849d5ab151cba172d690b52d919fada0bcacf1b449b2f6ea07",
      }
    end

    def short(key)
      "#{key[0..2]} , #{key[3..5]} , ending with , #{key[-3..-1]} , "
    end

    def generic_ending
      "#{notification 1} or #{listen_again 2}."
    end

    def notification(key)
      "Press #{key} if you want to send a notification to tell that the information is incorrect"
    end

    def listen_again(key)
      "Press #{key} to listen to this message again or this call will end in 3, 2, 1 , bye, !"
    end

    def contract_infos(contract)
      "The Name of the contract is: #{contract[:name]}, The CGI of the contract is: , #{short contract[:cgi]} , The block hash is: #{short contract[:block_hash]} , The transaction identifier is: , #{short contract[:transaction_id]} , #{generic_ending}."
    end

    r.post do
      r.on 'contract_infos' do
        r.is do
          contract_id = params[:Digits]
          contract_id = contract_id.to_i

          contract = lookup_contract contract_id

          Resp.new do |r|
            r.Say "Contract with id #{contract_id}, was found!"
            r.Pause 2
            r.Say "State is #{contract[:state]} by all parties, #{contract_infos contract}"
          end.text
        end
      end

      r.on "call" do
        Resp.new do |r|
          # make funny sounds
          # r.play soundfile todo
          r.Say "kiki"
          r.Pause 1
          r.Say "kiki"
          r.Pause 1
          r.Say "kiki"
          r.Pause 1
          r.Say "kiki!"
          r.Pause 1
          r.Say "bye!"
          r.Pause 2
        end.text
      end
    end

  end
end
