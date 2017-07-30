require_relative "../app/helpers/application_helper.rb"

describe ApplicationHelper do
  context '#isolate_tags' do
    it 'takes of a string of commma seperated tags and returns an array of tags' do
      expect(isolate_tags('hello, hi , , , , how, are, you')).to eq ['hello', 'hi', 'how', 'are', 'you']
    end
    it 'takes of a string of a single tag and returns an array of a single tag' do
      expect(isolate_tags('muggle')).to eq ['muggle']
    end
  end
end
