---
widget: slider
headless: true  # This file represents a page section.
active: true

# ... Put Your Section Options Here (section position etc.) ...

# Slide interval.
# Use `false` to disable animation or enter a time in ms, e.g. `5000` (5s).
interval: false

# Minimum slide height.
# Specify a height to ensure a consistent height for each slide.
height: 300px

weight: 10  # Order that this section will appear.


item:
  - title: Journey to Engineering
    content: A blog on all-things engineering.
    # Choose `center`, `left`, or `right` alignment.
    align: center
    # Overlay a color or image (optional).
    #   Deactivate an option by commenting out the line, prefixing it with `#`.
    # overlay_color: '#fff'  # An HTML color value.
    overlay_img: michael-dziedzic--Rc6usOigMk-unsplash.jpg  # Image path relative to your `assets/media/` folder
    overlay_filter: 0.9  # Darken the image. Value in range 0-1.
    # Call to action button (optional).
    #   Activate the button by specifying a URL and button label below.
    #   Deactivate by commenting out parameters, prefixing lines with `#`.
    cta_label: See al blog posts
    cta_url: './post'
    cta_icon_pack: fas
    cta_icon: book-reader
  - title: 'Hi there!'
    content: 'My name is Damiano, and I am not an engineer.'
    # Choose `center`, `left`, or `right` alignment.
    align: center
    # Overlay a color or image (optional).
    #   Deactivate an option by commenting out the line, prefixing it with `#`.
    # overlay_color: '#000'  # An HTML color value.
    overlay_img: markus-spiske-iar-afB0QQw-unsplash.jpg  # Image path relative to your `assets/media/` folder
    overlay_filter: 0.9  # Darken the image. Value in range 0-1.
    # Call to action button (optional).
    #   Activate the button by specifying a URL and button label below.
    #   Deactivate by commenting out parameters, prefixing lines with `#`.
    cta_label: Learn more
    cta_url: './about'
    cta_icon_pack: fas
    cta_icon: info
---
