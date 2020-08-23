require 'spec_helper'

describe 'no_erb_template' do
  context 'when class contains no template function calls' do
    let(:code) do
      <<-TEST_CLASS
        class no_template_calls {
          file { '/tmp/foo':
            content => 'bar',
          }
        }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'when class contains an epp template call' do
    let(:code) do
      <<-TEST_CLASS
        class epp_call {
          file { '/tmp/foo':
            content => epp('mymodule/bar.epp'),
          }
        }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  # and these should cause failiures

  context 'when class contains a template call' do
    let(:msg) { 'template() function call. Use epp() instead' }

    let(:code) do
      <<-TEST_CLASS
        class template_call {
          file { '/tmp/foo':
            content => template('mymodule/bar.epp'),
          }
        }
      TEST_CLASS
    end

    it 'detects a single problem' do
      expect(problems).to have(1).problem
    end

    it 'creates an error' do
      expect(problems).to contain_warning(msg).on_line(3).in_column(33)
    end
  end

  context 'when class contains an inline_template call' do
    let(:msg) { 'inline_template() function call. Use inline_epp() instead' }

    let(:code) do
      <<-TEST_CLASS
        class template_call {
          file { '/tmp/foo':
            content => inline_template('This is a rubbish template'),
          }
        }
      TEST_CLASS
    end

    it 'detects a single problem' do
      expect(problems).to have(1).problem
    end

    it 'creates an error' do
      expect(problems).to contain_warning(msg).on_line(3).in_column(40)
    end
  end
end
