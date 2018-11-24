RSpec.describe BotDelive do
  describe 'BotDelive::Configure' do
    before :each do
      BotDelive.configure do |config|
        config.app_id = 'test_id'
        config.secret_key = 'test_secret'
      end
      @config = BotDelive.config
    end

    it 'should return valid test_id' do
      expect(@config.app_id).to eq 'test_id'
    end

    it 'should return valid secret_key' do
      expect(@config.secret_key).to eq 'test_secret'
    end
  end

  describe 'BotDelive::Request' do
    describe 'successful requests' do
      before :all do
        BotDelive.configure do |config|
          config.app_id = ENV['BOT_DELIVE_APP_ID']
          config.secret_key = ENV['BOT_DELIVE_SECRET_KEY']
        end
      end

      describe '#verify' do
        before :all do
          @response = BotDelive.verify(access_code: 'access_code')
        end

        it 'should be success request' do
          expect(@response.success?).to eq true
        end

        it 'should not return nil payload' do
          expect(@response.payload).to_not be_nil
        end

        it 'should return user_id' do
          expect(@response.payload.user_id).to_not be_nil
        end
      end

      describe '#auth' do
        before :all do
          @response = BotDelive.auth(user_id: 'user_id')
        end

        it 'should be request success' do
          expect(@response.success?).to eq true
        end

        it 'should return true respond' do
          expect(@response.payload.respond).to eq true
        end

        it 'should not return nil payload' do
          expect(@response.payload).to_not be_nil
        end

        it 'should return user_id' do
          expect(@response.payload.user_id).to_not be_nil
        end
      end

      describe '#push' do
        before :all do
          @response = BotDelive.push(
            user_id: 'user_id',
            message: 'test message from ruby test'
          )
        end

        it 'should be request success' do
          expect(@response.success?).to eq true
        end

        it 'should not return err' do
          expect(@response.err).to be_nil
        end

        it 'should not return errCode' do
          expect(@response.err_code).to be_nil
        end
      end
    end
  end
end
