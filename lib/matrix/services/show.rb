module Matrix
  module Services
    class Show

      def initialize(matrix)
        @matrix = matrix
      end

      def run
        pixels_for_output = pixels
        row_num = 0
        result = ""
        @matrix.height.times do
          row_num += 1
          row = find_row_by(row_num, pixels_for_output)
          if row
            pixels_for_output.delete(row)
            formatted_row = format_(row)
            result = result + formatted_row
          end
        end
        puts result
      end

      private

      def pixels
        @matrix.pixels
      end

      def find_row_by(row_num, pixels_for_output)
        Pixels::Services::Find.new("pixels_by_row", pixels_for_output, {attr: row_num}).run
      end

      def format_(row)
        row.map { |p| p.color }.join("") + "\n"
      end

    end
  end
end