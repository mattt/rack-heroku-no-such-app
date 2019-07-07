module Rack
  module Heroku
    class NoSuchApp
      VERSION = "0.1.0"

      HEROKUAPP_DOMAIN_REGEXP = /.+\.heroku(app)?\.com/

      def initialize(app)
        @app = app
      end

      def call(env)
        if HEROKUAPP_DOMAIN_REGEXP === (env['HTTP_HOST'] || env['SERVER_NAME'])
          return [404, headers, [body]]
        end

        @app.call(env)
      end

      private

      def headers
        {
          'Content-Type'  => 'text/html',
          'Server' => "MochiWeb/1.0 (Any of you quaids got a smint?)"
        }
      end

      def body
        <<-EOF
  <!DOCTYPE html>
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Heroku | No such app</title>
    <style type='text/css'>
    body {
      background-color: white;
      color: #333333;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 36px;
      line-height: 18px;
      font-size: 14px; }

    .section {
      margin-bottom: 36px; }
      .section.friendly {
        color: #222222; }
        .section.friendly h1 {
          font-size: 26px;
          background-color: #dad8e4;
          padding: 18px 22px 15px 22px;
          margin: 0;
          overflow: hidden; }
          .section.friendly h1 strong {
            display: inline-block;
            float: left; }
          .section.friendly h1 small {
            display: inline-block;
            float: right;
            text-align: right;
            font-size: 18px;
            padding-top: 4px;
            color: #333333; }
        .section.friendly .article {
          border: 4px solid #dad8e4;
          padding: 24px 18px 18px 18px; }
          .section.friendly .article h3 {
            font-size: 20px;
            margin: 0 0 18px 0; }
          .section.friendly .article a {
            color: #6b6ceb; }
            .section.friendly .article a:visited {
              color: #1d1d3b; }
          .section.friendly .article p {
            font-size: 14px; }
          .section.friendly .article ul {
            list-style-type: square; }
    .section.original {
      background-color: #eeeeee;
      color: #444444; }
      .section.original h2 {
        background-color: #dddddd;
        margin: 0;
        padding: 18px 22px 18px 22px;
        font-size: 20px; }
      .section.original pre {
        margin: 0;
        padding: 18px 22px 18px 22px;
        overflow: auto;
        font-family: monaco, monospaced; }
        .section.original pre code {
          display: block;
          font-size: 11px;
          width: 100%; }
  </style>
    <script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2989055-7']);
  _gaq.push(['_setDomainName', '.heroku.com']);
  _gaq.push(['_trackPageview']);
  (function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

  </script>
  </head>
  <body>
      <div class='container'>
        <div class='section friendly'>
          <h1><strong>Heroku | No such app</strong></h1>
          <div class='article'>
            <p>There is no app configured at that hostname.<br/>Perhaps the app owner has renamed it, or you mistyped the URL.</p>
          </div>
        </div>
      </div>
  </body>
  </html>
      EOF
      end
    end
  end
end
