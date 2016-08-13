module MdlSearch
  class << self
    RAW_GROUPS_TABLE = YAML.load(File.read(File.expand_path('../../../yaml/groups.yml', __FILE__)))
    RAW_ICONS_TABLE = YAML.load(File.read(File.expand_path('../../../yaml/icons.yml', __FILE__)))
  end
end
