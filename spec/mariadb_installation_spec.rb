require 'serverspec'

if ['debian', 'ubuntu'].include?(os[:family])
    describe 'Specific Debian and Ubuntu family checks' do

        it 'install role packages' do
            packages = Array[ 'software-properties-common', 'python-mysqldb',
                              'mariadb-server', 'mariadb-client' ]

            packages.each do |pkg_name|
                expect(package(pkg_name)).to be_installed
            end
        end

        describe service('mysql') do
            it { should  be_running }
            it { should  be_enabled }
        end
    end
end

if ['redhat'].include?(os[:family])
    describe 'Specific RedHat family checks' do

        it 'install role packages' do
            packages = Array[ 'MySQL-python',
                              'MariaDB-server', 'MariaDB-client' ]

            packages.each do |pkg_name|
                expect(package(pkg_name)).to be_installed
            end
        end

        describe service('mysql') do
            it { should  be_running }
            it { should  be_enabled }
        end
    end
end

