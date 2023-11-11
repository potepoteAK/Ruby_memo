require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
  while true do
    puts "拡張子を除いたファイル名を入力してください。"
    file_name = gets
    file_name = file_name.chomp + ".csv"
    
    # 同名のファイルが上書きされるのを防ぐ
    if File.exist?(file_name)
      puts "すでに同名のファイルが存在しています。"
    else
      break;
    end
  end
  
  CSV.open(file_name,'w',:quote_char =>'') do |csv|
    puts "メモしたい内容を記入してください。"
    # Cloud9環境では複数回押さないと反応しないことがある。なぜかは不明。
    puts "完了したら、Ctrl + D (control + D)を押します。一回の押下で反応しない場合は、複数回押下して下さい。"
    inputs = readlines

    inputs.each do |input| 
      # 各行の末尾に改行コードが付いていた場合、chompで削除する
      input.chomp!
    end
    
    csv << inputs
  end

elsif memo_type == 2
  while true do
    puts "拡張子を除いたファイル名を入力してください。"
    file_name = gets
    file_name = file_name.chomp + ".csv"
    
    # 同名のファイルが上書きされるのを防ぐ
    if File.exist?(file_name)
      break;
    else
      puts "存在しないファイル名を指定しています。"
    end
  end
  
  CSV.open(file_name,'a',:quote_char =>'') do |csv|
    puts "追記したい内容を記入してください。"
    # Cloud9環境では複数回押さないと反応しないことがある。なぜかは不明。
    puts "完了したら、Ctrl + D (control + D)を押します。一回の押下で反応しない場合は、複数回押下して下さい。"
    inputs = readlines

    inputs.each do |input| 
      # 各行の末尾に改行コードが付いていた場合、chompで削除する
      input.chomp!
    end
    
    csv << inputs
  end
else
  puts "半角の1か2を指定してください。"
end