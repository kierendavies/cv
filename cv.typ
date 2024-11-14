#set page(
  paper: "a4",
  margin: 2.5cm,
)

#set text(
  font: "Libertinus Sans",
  size: 10pt,
)

#set par(justify: true)

#show heading.where(level: 1): heading => [
  #v(1em, weak: true)
  #line(length: 100%, stroke: 0.25pt)
  #v(1em, weak: true)
  #heading
  #v(0.25em)
]

#let icon(path, alt: none, size: auto, fill: luma(50%)) = (
  context {
    let size = if size == auto {
      let height = measure("").height
      height * 1.6
    } else {
      size
    }

    box(
      image.decode(
        read(path).replace("<svg ", "<svg fill=\"" + fill.to-hex() + "\" "),
        alt: alt,
        width: size,
        height: size,
        fit: "contain",
      ),
      inset: (y: size * -0.1875),
    )
  }
)

#set document(
  author: ("Kieren Davies"),
  title: [Kieren Davies],
)

#grid(
  columns: (auto, 1fr),
  align: (left, right),
  [
    #text(
      size: 2em,
      weight: "bold",
      top-edge: "x-height",
    )[
      Kieren Davies
    ]
    #v(1.2em, weak: true)
    #text(size: 1.75em)[
      Software Engineer
    ]
  ],
  grid(
    columns: 2,
    column-gutter: 0.8em,
    row-gutter: 0.8em,
    align: left,
    [
      #icon("icons/phone-solid.svg", alt: "Phone")
      #link("tel:+31629805112")[+31~629805112]
    ],
    [
      #icon("icons/linkedin-brands-solid.svg", alt: "LinkedIn")
      #link("https://www.linkedin.com/in/kierendavies/")[kierendavies]
    ],

    [
      #icon("icons/envelope-solid.svg", alt: "Email")
      #link("mailto:kieren@kdavi.es")[kieren\@kdavi.es]
    ],
    [
      #icon("icons/github-brands-solid.svg", alt: "GitHub")
      #link("https://github.com/kierendavies/")[kierendavies]
    ],
  ),
)

#let timeline(..entries) = (
  context {
    let when-width = measure([0000--0000]).width

    grid(
      columns: (when-width, auto),
      column-gutter: 0.65em,
      row-gutter: 1em,
      align: (right, left),

      ..{
        for entry in entries.pos() {
          (
            entry.when,
            entry.content,
          )
        }
      },
    )
  }
)

#let work(when: none, title: none, title-note: none, company: none, keywords: none, description) = {
  (
    when: when,
    content: [
      #set par(spacing: 0.65em)

      _#company;_ --- *#title* #title-note
      #h(1fr)
      #if keywords != none [
        _(#keywords)_
      ]

      #description
    ],
  )
}

#let education(when: (), degree: (), institution: ()) = {
  (
    when: when,
    content: [
      _#institution;_ --- #degree
    ],
  )
}

= #icon("icons/briefcase-solid.svg") #h(0.25em) Selected work experience

#timeline(
  work(
    when: [2023--2024],
    company: [BLoSH],
    title: [Software Engineer],
    keywords: [Rust, Linux, AWS, Azure, Alibaba Cloud, Python, Polars],
  )[
    Maintained and extended a high-frequency cryptocurrency trading system.
    Analysed and optimised performance across the application, operating system, and network, to reduce latency by milliseconds and significantly increase trading returns.
    Created a system to dynamically optimise cloud architecture.
    Designed a novel high-performance data structure.
    Created the company's first futures trading strategy.
  ],

  work(
    when: [2021--2023],
    company: [Zivver],
    title: [Staff Software Engineer],
    keywords: [Scala, PostgreSQL, AWS],
  )[
    Implemented features for a secure messaging product, and ensured its security and scalability.
    Collaborated extensively with product development, infrastructure, and security teams.
    Facilitated better DevOps practices across teams.
    Created tooling and documentation to improve developer experience, velocity, and software quality.
    Coached junior engineers.
    Established an on-call rotation.
    Established a new interviewing and hiring process, and ran interviewer training.
    Organised regular internal "tech talks".
  ],

  work(
    when: [2021],
    company: [Zivver],
    title: [Engineering Manager],
  )[
    Took over and grew a cross-functional team to build and launch a new B2B product.
  ],

  work(
    when: [2020--2021],
    company: [Zivver],
    title: [Senior Software Engineer],
  )[],

  work(
    when: [2019--2020],
    company: [Independent View],
    title: [Senior Software Engineer],
    keywords: [Scala, Java, Python, SQL Server],
  )[
    Maintained a futures trading system with manual execution.
    Created internal tooling and reporting for traders and analysts.
  ],

  work(
    when: [2018],
    company: [ODEM],
    title: [Blockchain Engineer],
    title-note: [(freelance)],
    keywords: [Ethereum, Solidity],
  )[
    Implemented Ethereum smart contracts for issuing educational diplomas.
  ],

  work(
    when: [2017--2019],
    company: [Booking.com],
    title: [Software Engineer],
    keywords: [Perl, Python, Go, MySQL, Hadoop, Kubernetes, GCP],
  )[
    Implemented user-facing A/B tests.
    Created tooling for SEO research and A/B testing, including data pipelines which processed billions of events per day.
    Created a platform for self-service provisioning of GCP projects with integration into the on-premises Kubernetes cluster.
    Ran training for technical interviewers, and authored most of the interview tasks.
  ],

  work(
    when: [2015],
    company: [Amazon Web Services],
    title: [Software Engineer Intern],
    keywords: [Ruby, AWS],
  )[],

  work(
    when: [2013],
    company: [Facebook],
    title: [Software Engineer Intern],
    keywords: [Java, Hadoop],
  )[],
)

= #icon("icons/graduation-cap-solid.svg") #h(0.25em) Education

#timeline(
  education(
    when: [2016],
    institution: [University of Cape Town],
    degree: [*B.Sc. (Hons.)* (postgraduate), Computer Science],
  ),

  education(
    when: [2014],
    institution: [University of Cape Town],
    degree: [*B.Sc.*, Mathematics and Computer Science],
  ),
)

= #icon("icons/medal-solid.svg") #h(0.25em) Achievements

#timeline((
  when: [2014, 2017],
  content: [
    _International Collegiate Programming Contest_ --- World finalist
  ],
))

= #icon("icons/newspaper-solid.svg") #h(0.25em) Publications

#show bibliography: none
#bibliography("pubs.yaml", title: none, style: "ieee-no-numbers.csl")

// #cite(<uct>, form: "full")

// #cite(<springer>, form: "full")

#cite(<ijait>, form: "full")
