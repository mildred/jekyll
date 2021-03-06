module Jekyll

  class Layout
    include Convertible

    # Gets the Site object.
    attr_reader :site

    # The page the layout encloses currently.
    attr_reader :page

    # Gets/Sets the extension of this layout.
    attr_accessor :ext

    # Gets/Sets the Hash that holds the metadata for this layout.
    attr_accessor :data

    # Gets/Sets the content of this layout.
    attr_accessor :content

    # Initialize a new Layout.
    #
    # site - The Site.
    # base - The String path to the source.
    # name - The String filename of the post file.
    def initialize(site, base, name)
      @site = site
      @base = base
      @name = name

      self.data = {}

      self.process(name)
      self.read_yaml(base, name)
    end

    # Extract information from the layout filename.
    #
    # name - The String filename of the layout file.
    #
    # Returns nothing.
    def process(name)
      self.ext = File.extname(name)
    end

    # Render layout for a page
    #
    # Call the converter on that page output
    def render(page)
      @page = page
      converter.run(page.output, self)
      @page = nil
    end
  end

end
