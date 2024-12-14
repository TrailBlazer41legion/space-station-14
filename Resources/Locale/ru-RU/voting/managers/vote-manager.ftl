ui-vote-initiator-server = Сервер

## Default.Votes

ui-vote-restart-title = Перезапуск раунда
ui-vote-restart-succeeded = Голосование о перезапуске раунда успешно.
ui-vote-restart-failed = Голосование о перезапуске раунда отклонено (требуется { TOSTRING($ratio, "P0") }).
ui-vote-restart-fail-not-enough-ghost-players = Голосование о перезапуске раунда отклонено: Минимум { $ghostPlayerRequirement }% игроков должно быть призраками чтобы запустить голосование о перезапуске. В данный момент игроков-призраков недостаточно.
ui-vote-restart-yes = Да
ui-vote-restart-no = Нет
ui-vote-restart-abstain = Воздерживаюсь
ui-vote-gamemode-title = Следующий режим игры
ui-vote-gamemode-tie = Ничья в голосовании за игровой режим! Выбирается... { $picked }
ui-vote-gamemode-win = { $winner } победил в голосовании за игровой режим!
ui-vote-map-title = Следующая карта
ui-vote-map-tie = Ничья при голосовании за карту! Выбирается... { $picked }
ui-vote-map-win = { $winner } выиграла голосование о выборе карты!
ui-vote-map-notlobby = Голосование о выборе карты действует только в предраундовом лобби!
ui-vote-map-notlobby-time = Голосование о выборе карты действует только в предраундовом лобби, когда остаётся { $time } времени!
# Votekick votes
ui-vote-votekick-unknown-initiator = Игрок
ui-vote-votekick-unknown-target = Неизвестный игрок
ui-vote-votekick-title = { $initiator } вызвал голосование на исключение пользователя: { $targetEntity }. Причина: { $reason }
ui-vote-votekick-yes = Да
ui-vote-votekick-no = Нет
ui-vote-votekick-abstain = Воздержусь
ui-vote-votekick-success = Голосование на исключение { $target } прошло успешно. Причина исключения: { $reason }
ui-vote-votekick-failure = Голосование на исключение { $target } провалилось. Причина исключения: { $reason }
ui-vote-votekick-not-enough-eligible = Недостаточно подходящих избирателей, чтобы начать голосование на исключение: { $voters }/{ $requirement }
ui-vote-votekick-server-cancelled = Голосование на исключение { $target } было отменено сервером.