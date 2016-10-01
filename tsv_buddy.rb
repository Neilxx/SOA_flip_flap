
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    label = []
    @data = []
    tsv.each_line do |line|
      lines = line.strip.split("\t")
      student = {}
      if label.empty?
        label = lines
      else
        lines.each_with_index { |item, index| student[label[index]] = item }
        @data.push(student)
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    data_string = ''
    label = @data[0].each_key.map { |x| x }
    data_string += "#{label.join("\t")}\n"
    @data.each do |item|
      data_inline = item.each_value.map { |value| value }
      data_string += "#{data_inline.join("\t")}\n"
    end
    data_string
  end
end
