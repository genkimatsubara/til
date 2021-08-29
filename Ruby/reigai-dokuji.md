# 独自の例外クラス
例外クラスは独自に定義することも可能。
例外クラスを定義する場合は特別な理由がない限り、`StandardError`クラスか、そのサブクラスを継承する。(Exceptionクラスは直接継承しないようにする。)
### 構文
```
class NoSignal < StandardError
  attr_reader :signal

  def initialize(message, signal)
    @signal = signal
    super("#{message} #{signal}")
  end
end

def action(signal)
  case signal
  when :red
    "Stop"
  when :blue
    "Go"
  when :yellow
    "caution"
  else
    raise NoSignal.new("間違ったなシグナルです", signal)
  end
end

begin
  action(:pink)
rescue NoSignal => e
  p e.class
  p e.message
  p e.signal
end
```

