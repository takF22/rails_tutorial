Time::DATE_FORMATS[:datetime] = '%Y-%m-%d %H:%M'
Date::DATE_FORMATS[:default]      = "%Y-m-d"
#viewファイルで日時表示する箇所に「.to_s(:datetime)」を追加