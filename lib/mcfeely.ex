defmodule McFeely do
  import Swoosh.Email

  import McFeely.MarkdownTools

  def send_tests() do
    send_transactional()
  end

  def send_transactional() do
    new()
    |> to({"Pepe Silvia", "mike@mikezornek.com"})
    |> from({"McFeely", "hello@guildflow.com"})
    |> subject("Testing Transactional!")
    |> html_body("<h1>Transactional Body</h1>")
    |> text_body("Transactional Body\n\nLine3")
    |> McFeely.Mailer.deliver()
  end

  def send_transactional_with_template() do
    attrs = %{
      group_name: "Android Book Club",
      group_url: "https://androidbookclub.guildflow.com",
      edit_notifications_url: "https://androidbookclub.guildflow.com/settings/notifications",
      subject: "Test Email",
      text_content: sample_text_body(),
      html_content: rendered_markdown(sample_text_body())
    }

    new()
    |> to({"Pepe Silvia", "mike@mikezornek.com"})
    |> from({"McFeely", "hello@guildflow.com"})
    |> put_provider_option(:template_alias, "group-message-template")
    |> put_provider_option(:template_model, attrs)
    |> McFeely.Mailer.deliver()
  end

  defp send_broadcast() do
    email_to_pepe =
      new()
      |> to({"Pepe Silvia", "mike@mikezornek.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("Testing Broadcast (No Template)!")
      |> html_body("<h1>Broadcast Body</h1>")
      |> text_body("Broadcast Body\n\nLine3")

    email_to_carol =
      new()
      |> to({"Carol in HR", "mzornek+carolhr@gmail.com"})
      |> from({"McFeely", "hello@guildflow.com"})
      |> subject("Testing Broadcast (No Template)!")
      |> html_body("<h1>Broadcast Body</h1>")
      |> text_body("Broadcast Body\n\nLine3")

    McFeely.Mailer.deliver_many([email_to_pepe, email_to_carol])
  end

  defp email(to_name, to_email) do
    attrs = %{
      group_name: "Android Book Club",
      group_url: "https://androidbookclub.guildflow.com",
      edit_notifications_url: "https://androidbookclub.guildflow.com/settings/notifications",
      subject: "Test Email",
      text_content: sample_text_body(),
      html_content: rendered_markdown(sample_text_body())
    }

    new()
    |> to({to_name, to_email})
    |> from({"McFeely", "hello@guildflow.com"})
    |> put_provider_option(:template_alias, "group-message-template")
    |> put_provider_option(:template_model, attrs)
    |> put_provider_option(:message_stream, "group-message-stream")
  end

  def sample_text_body() do
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
