defmodule McFeely do
  import Swoosh.Email

  import McFeely.MarkdownTools

  def send_tests() do
    IO.puts("deliver_transactional")
    IO.inspect(deliver_transactional())

    IO.puts("deliver_many_transactional")
    IO.inspect(deliver_many_transactional())

    IO.puts("deliver_transactional_with_template")
    IO.inspect(deliver_transactional_with_template())

    IO.puts("deliver_many_broadcast")
    IO.inspect(deliver_many_broadcast())

    IO.puts("deliver_many_broadcast_with_template")
    IO.inspect(deliver_many_broadcast_with_template())
  end

  defp deliver_transactional() do
    new()
    |> to({"Pepe Silvia", "mzornek+pepe@gmail.com"})
    |> from({"McFeely", "hello@guildflow.com"})
    |> subject("deliver_transactional")
    |> html_body("<h1>Transactional Body</h1>")
    |> text_body("Transactional Body\n\nLine3")
    |> McFeely.Mailer.deliver()
  end

  defp deliver_many_transactional() do
    email_to_pepe =
      new()
      |> to({"Pepe Silvia", "mzornek+pepe@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("deliver_many_transactional pepe")
      |> html_body("<h1>Transactional Body</h1>")
      |> text_body("Transactional Body\n\nLine3")

    email_to_carol =
      new()
      |> to({"Carol in HR", "mzornek+carol@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("deliver_many_transactional carol")
      |> html_body("<h1>Transactional Body</h1>")
      |> text_body("Transactional Body\n\nLine3")

    McFeely.Mailer.deliver_many([email_to_pepe, email_to_carol])
  end

  defp deliver_transactional_with_template() do
    attrs = %{
      group_name: "Android Book Club",
      group_url: "https://androidbookclub.guildflow.com",
      edit_notifications_url: "https://androidbookclub.guildflow.com/settings/notifications",
      subject: "deliver_transactional_with_template",
      text_content: sample_text_body(),
      html_content: rendered_markdown(sample_text_body())
    }

    new()
    |> to({"Pepe Silvia", "mzornek+pepe@gmail.com"})
    |> from({"McFeely", "hello@guildflow.com"})
    |> put_provider_option(:template_alias, "group-message-template")
    |> put_provider_option(:template_model, attrs)
    |> McFeely.Mailer.deliver()
  end

  defp deliver_many_broadcast() do
    email_to_pepe =
      new()
      |> to({"Pepe Silvia", "mzornek+pepe@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("deliver_many_broadcast pepe")
      |> html_body("<h1>Broadcast Body</h1>")
      |> text_body("Broadcast Body\n\nLine3")

    email_to_carol =
      new()
      |> to({"Carol in HR", "mzornek+carol@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("deliver_many_broadcast carol")
      |> html_body("<h1>Broadcast Body</h1>")
      |> text_body("Broadcast Body\n\nLine3")

    McFeely.Mailer.deliver_many([email_to_pepe, email_to_carol], message_stream: "group-message-stream")
  end

  defp deliver_many_broadcast_with_template() do
    attrs = %{
      group_name: "Android Book Club",
      group_url: "https://androidbookclub.guildflow.com",
      edit_notifications_url: "https://androidbookclub.guildflow.com/settings/notifications",
      subject: "deliver_many_broadcast_with_template",
      text_content: sample_text_body(),
      html_content: rendered_markdown(sample_text_body())
    }

    email_to_pepe =
      new()
      |> to({"Pepe Silvia", "mzornek+pepe@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> put_provider_option(:template_alias, "group-message-template")
      |> put_provider_option(:template_model, attrs)

    email_to_carol =
      new()
      |> to({"Carol in HR", "mzornek+carol@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> put_provider_option(:template_alias, "group-message-template")
      |> put_provider_option(:template_model, attrs)

    McFeely.Mailer.deliver_many([email_to_pepe, email_to_carol], message_stream: "group-message-stream")
  end

  defp sample_text_body() do
    """
    # Headline 1

    ## Headline 2

    This is a paragraph with a [link](http://mikezornek.com).

    * simple
    * list
    * here

    1. one
    2. two
    3. three
    """
  end
end
