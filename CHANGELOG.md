# Monologue: the changelog!
(for upgrade informations, see UPGRADE.md)

## 0.1.1

- the "comment" link in admin now works as expected and shows all comments from your Disqus account;
- changed URL pattern (fix for https://github.com/jipiboily/monologue/issues/64 by https://github.com/jipiboily/monologue/issues/59);
- you can now use your main_app layout with Monologue (https://github.com/jipiboily/monologue/issues/54) (use config: Monologue.layout. See wiki for more information);
- added Open Graph tags;
- posts published with a date in the future are not displayed anymore;
- multiple bug fixes;


## 0.1.0: initial release (May 5, 2012)

FEATURES

 - Rails mountable engine (fully named spaced)
 - tested
 - back to basics: few features
 - it has post revisions (no UI to choose published revision yet, but it keeps your modification history)
 - it has few external dependencies (no Devise or Sorcery, etc…) so we don't face problem integrating with existing Rails app.(Rails mountable engines: dependency nightmare?)
 - comments are handled by disqus
 - enforcing Rails cache for better performance (only supports file store for now)
 - runs on Heroku