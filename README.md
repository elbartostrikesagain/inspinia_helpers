# InspiniaHelpers

http://webapplayers.com/inspinia_admin-v2.0/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inspinia_helpers', git: 'git://github.com/elbartostrikesagain/inspinia_helpers.git'
```

## Usage

```ruby
include InspiniaHelpers
```

## Examples(incomplete + in haml)

#### Modal
```ruby
= modal_content do |header, body, footer|
  = header.call do
    = modal_close
    %h4.modal-title ModalTitleHere
  = body.call do
    My Body Here
  = footer.call
    My Footer here
```

#### Tabs
```ruby
= tab_buttons 2, 'optionalIDForMultipleTabSections' do |tab1, tab2|
  = tab1.call 'active tab1_class' do
    Tab1 Title
  = tab2.call 'tab2_class' do
    Tab2 Title
= tab_content 2, 'optionalIDForMultipleTabSections' do |tab1, tab2|
  = tab1.call 'tab1_class active' do
    Tab1 Content
  = tab2.call 'tab2_class' do
    Tab2 Content
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/inspinia_helpers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
