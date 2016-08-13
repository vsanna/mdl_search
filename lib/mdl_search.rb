require "pry"
require "pry-byebug"

require "mdl_search/version"
require "mdl_search/raw_data"
require "mdl_search/icon"
require "mdl_search/searcher"
require "mdl_search/updater"
require "mdl_search/cli"
require "mdl_search/core"


module MdlSearch
  # after all, you can use where
end

# 最終的にしたいこと
# 1. コマンドラインで検索で切る
#  - group
#  - keyword
#    - できれば日本語対応
#  - name
# 2. requireして使うこともできる
#  - MdlSearch.search(name: 'hoge', keywords: ['a', 'b', 'c'])
# 3. mdl_helper用にtableを更新する機能
#  - MdlSearch::IconTable.update / MdlSearch::IconTable.create
